from system.core.model import Model

class Quote(Model):
    def __init__(self):
        super(Quote, self).__init__()

    def create(self, info):
    	#validations
    	errors = []
    	if len(info['author']) < 3:
    		errors.append("Author must be at least 3 characters")
    	if len(info['quote']) < 10:
    		errors.append("Quote must be at least 10 characters")
    	if errors:
    		return {'status': False, 'errors': errors}

    	query = 'INSERT INTO quotes (quote, author, user_id, created_at, updated_at) VALUES (:quote, :author, :user_id, NOW(), NOW())'
    	data = {
    		'quote': info['quote'],
    		'author': info['author'],
    		'user_id': info['user_id']
    	}
    	self.db.query_db(query, data)
    	return {'status': True}

    def get_quotes(self, id):
    	query = 'SELECT quotes.id, quotes.quote, quotes.author, quotes.user_id, users.alias FROM quotes JOIN users ON quotes.user_id = users.id WHERE quotes.id NOT IN (SELECT quote_id FROM favorites WHERE favorites.user_id=:id)'
    	data = {'id': id}
    	return self.db.query_db(query, data)

    def insert_into_faves(self, info):
    	query = 'INSERT INTO favorites (created_at, updated_at, user_id, quote_id) VALUES (NOW(), NOW(), :user_id, :quote_id)'
    	data = {
    		'user_id': info['user_id'],
    		'quote_id': info['quote_id']
    	}
    	return self.db.query_db(query, data)

    def get_faves(self, id):
    	query = 'SELECT favorites.id, quotes.quote, quotes.author, quotes.user_id, users.alias FROM quotes JOIN favorites ON quotes.id = favorites.quote_id JOIN users ON users.id = favorites.user_id WHERE favorites.user_id = :id'
    	data = {'id': id}
    	return self.db.query_db(query, data)

    def delete_fave(self, id):
    	query = 'DELETE FROM favorites WHERE id=:id'
    	data = {'id': id}
    	return self.db.query_db(query, data)

    def get_user_quotes(self, id):
    	query = 'SELECT quotes.author, quotes.quote FROM quotes WHERE quotes.user_id = :id'
    	data = {'id': id}
    	return self.db.query_db(query, data)

    def get_quote_count(self, id):
    	query = 'SELECT users.id, users.alias, COUNT(quotes.user_id) as count FROM users JOIN quotes ON quotes.user_id = users.id WHERE users.id = :id GROUP BY quotes.user_id'
    	data = {'id': id}
    	users = self.db.query_db(query, data)
    	return users
