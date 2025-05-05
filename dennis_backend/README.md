# dennis_backend

This backend uses FastAPI and PyTorch to train and serve a waste classification model.

## Files
- `train.py` - Trains the model using images in `garbage-dataset/`
- `predict.py` - Predicts waste class from input image
- `main.py` - FastAPI app to serve the model

## Setup

```bash
python -m venv env
env\Scripts\activate
pip install -r requirements.txt
