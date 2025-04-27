from flask import Flask, request, jsonify
# from flask_cors import CORS

app = Flask(__name__)
# CORS(app)  # Uncomment if you're using Flutter or anything cross-origin

@app.route('/classify', methods=['POST'])
def classify():
    data = request.get_json()
    query = data.get('query', '').lower()
    if 'plastic' in query:
        return jsonify({'category': 'plastic'})
    elif 'organic' in query:
        return jsonify({'category': 'organic'})
    else:
        return jsonify({'category': 'glass'})

@app.route("/")
def home():
    return "Hello from Smart_Waste backend!"

if __name__ == '__main__':
    app.run(debug=True)
