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

@app.route('/showSignIn')
def showSignIn():
    if session.get('user'):
        return render_template('userHome.html')
    else:
        return render_template('signin.html')
        
@app.route('/showSignUp')
def showSignUp():
    return render_template('signup.html')

@app.route('/howItWorks')
def showHowItWorks():
    return render_template('howItWorks.html')
    
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
                json.dumps({'message':'User created successfully !'})
                if _type == 1: #if the user is a vendor
                    redirect('/userVend')
                else:
                    redirect('/userHome')
            else:
                json.dumps({'error':str(data[0])})
                redirect('/'    )
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
                return render_template('error.html',error = 'Wrong Email address or Password')
        else:
            return render_template('error.html',error = 'Wrong Email address or Password')
    except Exception as e:
        return render_template('error.html',error = str(e))
    finally:
        cursor.close()
        con.close()
        
@app.route('/userHome')
def userHome():
    if (session.get('user') and session.get('vendorFlag') == 0):
        return render_template('userHome.html')
    else:
        return render_template('error.html', error = 'Unauthorized Access')
    
@app.route('/showUpdateHome')
def showUpdateHome():
    return render_template('updateHome.html')
        
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
            _presetgroundsize = request.form['presetgroundsize']
            _notes = request.form['notes']
            _user = session.get('user')
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_updateHome',(_address,_city,_groundsize,_presetgroundsize,_phonenumber,_state,_notes,_zipcode,_user))
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
    if (session.get('user') and session.get('vendorFlag') == 1):
        return render_template('userVend.html')
    else:
        return render_template('error.html', error = 'Unauthorized Access')

@app.route('/showUpdateVend')
def showUpdateVend():
    return render_template('updateVend.html')
        
@app.route('/updateVend',methods=['POST'])
def updateVend():
    try:
        if session.get('user'):
            _price_per_sf = request.form['price_per_sf']
            _state = request.form['state']
            _phonenumber = request.form['phonenumber']
            _notes = request.form['notes']
            _user = session.get('user')
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_updateVend',(_price_per_sf,_state,_phonenumber,_notes,_user))
            data = cursor.fetchall()
            if len(data) is 0:
                conn.commit()
                return redirect('/userVend')
            else:
                return render_template('error.html',error = 'An error occurred!')
        else:
            return render_template('error.html',error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html',error = str(e))
    finally:
        cursor.close()
        conn.close()
        
@app.route('/getHouses')
def getHouses():
    try:
        if session.get('user'):
            _user = session.get('user')
            con = mysql.connect()
            cursor = con.cursor()
            cursor.callproc('sp_GetHousesForVendors',(_user,))
            houses = cursor.fetchall()
            houses_dict = []
            for house in houses:
                house_dict = {
                        'Home ID': house[0],
                        'Address': house[1],
                        'City': house[2],
                        'State': house[3],
                        'Zip_Code': house[4],
                        'Phone_Number': house[5][:3]+'-'+house[5][3:6]+'-'+house[5][6:10],
                        'Ground_Size': house[6],
                        'Notes': house[7],
                        'Composite': 'the whole address here.'}
                houses_dict.append(house_dict)
            return json.dumps(houses_dict)
        else:
            return render_template('error.html', error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html', error = str(e))
        
@app.route('/showHouses')
def showHouses():
    return render_template('showHouses.html')
    
@app.route('/showSubmitBid')
def showSubmitBid():
    return render_template('submitBid.html')
    
@app.route('/submitBid',methods=['POST'])
def submitBid():
    try:
        if session.get('user'):
            _home_id = request.form['home_id']
            _price_per_sf = request.form['price_per_sf']
            _user = session.get('user')
            conn = mysql.connect()
            cursor = conn.cursor()
            cursor.callproc('sp_getVendorID',(_user,))
            data = cursor.fetchall()
            _vendor_id = data[0][0]
            cursor.callproc('sp_submitBid',(_home_id,_vendor_id,_price_per_sf,_user,))
            data = cursor.fetchall()
            if len(data) is 0:
                conn.commit()
                return redirect('/userVend')
            else:
                return render_template('error.html',error = 'An error occurred!')
        else:
            return render_template('error.html',error = 'Unauthorized Access')
    except Exception as e:
        return render_template('error.html',error = str(e))
    finally:
        cursor.close()
        conn.close()
        
@app.route('/showCurrentBid')
def showCurrentBid():
    return render_template('showCurrentBid.html')    

@app.route('/logout')
def logout():
    session.pop('user',None)
    return redirect('/')

if __name__ == "__main__":
    app.debug = True
    app.run()