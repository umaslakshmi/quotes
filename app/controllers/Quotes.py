from system.core.controller import *

class Quotes(Controller):
    def __init__(self, action):
        super(Quotes, self).__init__(action)
        self.load_model('Quote')
        self.load_model('User')
        self.db = self._app.db

    def home(self):
    	user = self.models['User'].get_user_by_id(session['id'])
    	quotes = self.models['Quote'].get_quotes(session['id'])
    	favorites = self.models['Quote'].get_faves(session['id'])
    	return self.load_view('/quotes/home.html', user=user, quotes=quotes, faves=favorites)

    def create(self):
		print request.form
		info={
			'author': request.form['author'],
			'quote': request.form['quote'],
			'user_id': session['id']
		}
		result = self.models['Quote'].create(info)
		if result['status']:
			return redirect('/quotes/home')
		else:
			for error in result['errors']:
				flash(error)
		return redirect('/quotes/home')

    def insert(self, id):
    	info = {
    		'user_id': session['id'],
    		'quote_id': id
    	}
    	self.models['Quote'].insert_into_faves(info)
    	return redirect('/quotes/home')

    def destroy(self, id):
    	self.models['Quote'].delete_fave(id)
    	return redirect('/quotes/home')
