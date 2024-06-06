# app/routes.py
from flask import Blueprint, jsonify
from .services.sportmonks_service import fetch_sportmonks_data
from .services.another_api_service import fetch_another_api_data

main = Blueprint('main', __name__)

@main.route('/api/sportmonks', methods=['GET'])
def get_sportmonks_data():
    data = fetch_sportmonks_data()
    return jsonify(data)

@main.route('/api/another', methods=['GET'])
def get_another_api_data():
    data = fetch_another_api_data()
    return jsonify(data)
