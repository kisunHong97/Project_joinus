from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
import requests

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'oracle://spring_project:1234@localhost:1521/XE'
db = SQLAlchemy(app)

class Store(db.Model):
    __tablename__ = 'store_table'
    sno = db.Column(db.Integer, primary_key=True)
    bno = db.Column(db.Integer, db.ForeignKey('business_table.bno'))
    s_name = db.Column(db.String(100), nullable=False)
    s_addrCode = db.Column(db.String(100), nullable=False)
    s_addrStreet = db.Column(db.String(100), nullable=False)
    s_addrDetail = db.Column(db.String(100), nullable=False)
    s_inst = db.Column(db.String(100), nullable=False)
    s_email = db.Column(db.String(100), nullable=False)
    s_URL = db.Column(db.String(100))
    s_phone = db.Column(db.String(100))
    s_revenue = db.Column(db.Float, default=0.0)


# 수익금 데이터를 가져와서 스프링으로 전송하는 API 엔드포인트
@app.route('/revenue', methods=['POST'])
def send_revenue():
    store = Store.query.first()
    revenue = store.s_revenue
    print("@@@@"+revenue)
    # 수익금 데이터를 스프링 프로젝트의 API로 전송
    spring_url = 'http://localhost:8080/mypage'  # 스프링 프로젝트의 API 엔드포인트 URL
    payload = {'revenue': revenue}
    response = requests.post(spring_url, json=payload)

    if response.status_code == 200:
        return jsonify({'message': 'Revenue sent successfully'})
    else:
        return jsonify({'message': 'Failed to send revenue'})


if __name__ == '__main__':
    app.run(debug=True)
