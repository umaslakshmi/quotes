"""
    Sample Controller File

    A Controller should be in charge of responding to a request.
    Load models to interact with the database and load views to render them to the client.

    Create a controller using this template
"""
from system.core.controller import *

class Users(Controller):
    def __init__(self, action):
        super(Users, self).__init__(action)
        self.load_model('User')
        self.load_model('Quote')
        self.db = self._app.db
   
    def index(self):
        return self.load_view('/users/index.html')

    def register(self):
        print request.form
        info = {
            'name': request.form['name'],
            'alias': request.form['alias'],
            'email': request.form['email'],
            'password': request.form['password'],
            'confirm_password': request.form['confirm-password'],
            'dob': request.form['dob']
        }
        result = self.models['User'].create_user(info)
        if result['status']:
            session['id'] = result['user']['id']
            return redirect('/quotes/home')
        else:
            for error in result['errors']:
                flash(error, 'regis_errors')
            return redirect('/')

    def login(self):
        print request.form
        info = {
            'email': request.form['email'],
            'password': request.form['password']
        }
        result = self.models['User'].check_user(info)
        if result:
            session['id'] = result['id']
            return redirect('/quotes/home')
        else:
            flash("Invalid email or password", 'login_errors')
            return redirect('/')

    def logout(self):
        session.pop('id')
        return redirect('/')

    def show(self, id):
        check = self.models['Quote'].get_quote_count(id)
        if not check:
            count = 0
        else:
            count = check[0]['count']
        user = self.models['User'].get_user_by_id(id)
        quotes = self.models['Quote'].get_user_quotes(id)
        return self.load_view('/users/show.html', user=user, quotes=quotes, count=count)



