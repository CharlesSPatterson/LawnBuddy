# LawnBuddy
# By: Charles Patterson

from flask import Flask, render_template, request, json, session, redirect
from flask.ext.mysql import MySQL
from werkzeug import generate_password_hash, check_password_hash

app = Flask(__name__)
app.secret_key = 'what is the magic password?'

mysql = MySQL()
 
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = 'root'
app.config['MYSQL_DATABASE_DB'] = 'lawnbuddy'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
mysql.init_app(app)

@app.route("/")
def main():
    return render_template('index.html')
    
@app.route('/showSignUp')
def showSignUp():
    return render_template('signup.html')

@app.route('/howItWorks')
def showHowItWorks():
    return render_template('howItWorks.html')
    
@app.route('/showUpdateHome')
def showUpdateHome():
    return render_template('updateHome.html')
    
@app.route('/showSignIn')
def showSignIn():
    if session.get('user'):
        return render_template('userHome.html')
    else:
        return render_template('signin.html')
    
@app.route('/signUp',methods=['POST','GET'])
def signUp():
    try:
        _name = request.form['inputName']
        _email = request.form['inputEmail']
        _password = request.form['inputPassword']
        _type = request.form['vendorFlag']
        # validate the received values
        if _name and _email and _password and _type:
            conn = mysql.connect()
            cursor = conn.cursor()
            _hashed_password = generate_password_hash(_password)
            cursor.callproc('sp_createUser',(_name,_email,_hashed_password,_type))
            data = cursor.fetchall()
            if len(data) is 0:
                conn.commit()
                return json.dumps({'message':'User created successfully !'})
            else:
                return json.dumps({'error':str(data[0])})
        else:
            return json.dumps({'html':'<span>Enter the required fields</span>'})

    except Exception as e:
        return json.dumps({'error':str(e)})
    finally:
        cursor.close() 
        conn.close()

@app.route('/validateLogin',methods=['POST'])
def validateLogin():
    try:
        _username = request.form['inputEmail']
        _password = request.form['inputPassword']
        con = mysql.connect()
        cursor = con.cursor()
        cursor.callproc('sp_validateLogin',(_username,))
        data = cursor.fetchall()
        if len(data) > 0:
            if check_password_hash(str(data[0][3]),_password):
                session['user'] = data[0][0]
                session['vendorFlag'] = data[0][4]
                if session.get('vendorFlag') == 0:
                    return redirect('/userHome')
                else:
                    return redirect('/userVend')
            else:
                return render_template('error.html',error = 'Wrong Email address or Password test 1.')
        else:
            return render_template('error.html',error = 'Wrong Email address or Password test 2.')
    except Exception as e:
        return render_template('error.html',error = str(e))
    finally:
        cursor.close()
        con.close()
        
@app.route('/userHome')
def userHome():
    if session.get('user'):
        return render_template('userHome.html')
    else:
        return render_template('error.html', error = 'Unauthorized Access')
        
@app.route('/updateHome',methods=['POST'])
def updateHome():
    try:
        if session.get('user'):
            _address = request.form['address']
            _city = request.form['city']
            _state = request.form['state']
            _zipcode = request.form['zipcode']
            _phonenumber = request.form['phonenumber']
            _groundsize = request.form['groundsize']
            _notes = request.form['notes']
            _user = session.get('user')
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_updateHome',(_address,_city,_groundsize,_phonenumber,_state,_notes,_zipcode,_user))
            data = cursor.fetchall()
            if len(data) is 0:
                conn.commit()
                return redirect('/userHome')
            else:
                return render_template('error.html',error = 'An error occurred!')
        else:
            return render_template('error.html',error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html',error = str(e))
    finally:
        cursor.close()
        conn.close()
        
@app.route('/userVend')
def userVend():
    if session.get('user'):
        return render_template('userVend.html')
    else:
        return render_template('error.html', error = 'Unauthorized Access')
        
@app.route('/logout')
def logout():
    session.pop('user',None)
    return redirect('/')       

if __name__ == "__main__":
    app.debug = True
    app.run()