import torch
from torchvision import models, transforms
from PIL import Image
import os

# Model setup
num_classes = 10  # change if your dataset has different number
model = models.resnet18()
model.fc = torch.nn.Linear(model.fc.in_features, num_classes)
model.load_state_dict(torch.load("waste_model.pth", map_location=torch.device("cpu")))
model.eval()

# Define transform
transform = transforms.Compose([
    transforms.Resize((224, 224)),
    transforms.ToTensor()
])

# Predict function
def predict_image(image_path):
    image = Image.open(image_path).convert('RGB')
    image = transform(image).unsqueeze(0)

    with torch.no_grad():
        outputs = model(image)
        _, predicted = torch.max(outputs, 1)

    class_names = os.listdir("garbage-dataset")  # Assumes folder names = class names
    return class_names[predicted.item()]

# Test
if __name__ == "__main__":
    test_image = "test3.jpg"  # replace with your test image path
    result = predict_image(test_image)
    print("Predicted class:", result)
