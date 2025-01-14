from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///site.db'
db = SQLAlchemy(app)

class Customer(db.Model):
    customerid = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)

class Order(db.Model):
    orderid = db.Column(db.Integer, primary_key=True)
    customerid = db.Column(db.Integer, db.ForeignKey('customer.customerid'), nullable=False)

@app.route('/')
def index():
    customers = Customer.query.all()
    orders = Order.query.all()
    return render_template('index.html', customers=customers, orders=orders)

# Customer CRUD operations

@app.route('/add_customer', methods=['POST'])
def add_customer():
    name = request.form['name']
    new_customer = Customer(name=name)
    db.session.add(new_customer)
    db.session.commit()
    return redirect(url_for('index'))

@app.route('/edit_customer/<int:id>', methods=['GET', 'POST'])
def edit_customer(id):
    customer = Customer.query.get(id)
    if request.method == 'POST':
        customer.name = request.form['name']
        db.session.commit()
        return redirect(url_for('index'))
    return render_template('edit_customer.html', customer=customer)

@app.route('/delete_customer/<int:id>')
def delete_customer(id):
    customer = Customer.query.get(id)
    db.session.delete(customer)
    db.session.commit()
    return redirect(url_for('index'))

# Order CRUD operations

@app.route('/add_order', methods=['POST'])
def add_order():
    customer_id = request.form['customer_id']
    new_order = Order(customerid=customer_id)
    db.session.add(new_order)
    db.session.commit()
    return redirect(url_for('index'))

@app.route('/edit_order/<int:id>', methods=['GET', 'POST'])
def edit_order(id):
    order = Order.query.get(id)
    if request.method == 'POST':
        order.customerid = request.form['customer_id']
        db.session.commit()
        return redirect(url_for('index'))
    return render_template('edit_order.html', order=order)

@app.route('/delete_order/<int:id>')
def delete_order(id):
    order = Order.query.get(id)
    db.session.delete(order)
    db.session.commit()
    return redirect(url_for('index'))

if __name__ == '__main__':
    with app.app_context():
        db.create_all()
    app.run(debug=True)