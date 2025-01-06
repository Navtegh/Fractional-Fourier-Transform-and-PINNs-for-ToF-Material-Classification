# Fractional-Fourier-Transform-and-PINNs-for-ToF-material-Classification

## Project Overview
This project explores advanced techniques for material classification using Time-of-Flight (ToF) imagery data. By integrating Physics-Informed Neural Networks (PINNs) and developing a novel neural network architecture with a learnable Fractional Fourier transform, this research aims to enhance classification accuracy and efficiency. The project focuses on reducing computational overhead to enable real-time classification on resource-constrained devices.

### Author:
**Navtegh Singh Gill**  
Bachelor of Engineering, Computer Engineering  
Thapar Institute of Engineering & Technology, Patiala  
Place of Work: University of Wuppertal, Germany

---
## Table of Contents
- [Background](#background)
- [Objectives](#objectives)
- [Methodology](#methodology)
- [Observations and Findings](#observations-and-findings)
- [Limitations](#limitations)
- [Conclusion and Future Work](#conclusion-and-future-work)
- [Setup and Requirements](#setup-and-requirements)
- [Usage](#usage)
- [License](#license)

---
## Background
ToF imaging technology is widely used in fields such as robotics, autonomous vehicles, and industrial automation due to its ability to capture 3D depth information by measuring the time light takes to return to the sensor. This project leverages the rich data from ToF sensors to classify materials based on their unique light interaction properties, addressing challenges in computational efficiency and accuracy.

---
## Objectives
- Develop optimized frameworks for ToF-based material classification.
- Investigate advanced techniques such as PINNs and data transformation methods.
- Implement a custom neural network with a learnable Fractional Fourier transform layer.
- Validate the proposed methods on real-world datasets for diverse material classification.

---
## Methodology
1. **Dataset**: Data collected using the PMD Selene module, capturing ToF imagery of 14 materials at various distances and orientations.
2. **Preprocessing**: Normalization, data balancing, and splitting (75:25 for training/validation).
3. **PINNs**: Integration of physical principles into the neural network using exponentially modified Gaussian functions.
4. **Data Transformation**: Application of Inverse Fourier Transform (IFFT) and Fractional Fourier Transform (FrFT) to enhance data representation.
5. **Custom Neural Network**: Development of a neural network with a learnable fractional order parameter for adaptive data transformation during training.

---
## Observations and Findings
- Conversion of ToF data to time-domain resulted in sinc-like functions, providing insights into temporal characteristics.
- The learnable fractional Fourier transform layer converged to a parameter value near -0.8, consistently improving classification accuracy across datasets.
- The approach demonstrated up to 96.9% accuracy for five-material classification and 94% accuracy for 14 materials.

---
## Limitations
- Limited dataset diversity (five primary materials used for initial testing).
- Computational complexity restricts application to larger datasets.
- Performance heavily dependent on hardware configurations.
- Environmental factors such as lighting and temperature were not fully explored.

---
## Conclusion and Future Work
The project successfully optimized ToF-based material classification using novel neural network architectures and advanced transformation techniques. Future research will focus on:
- Expanding datasets for more diverse material classification.
- Implementing real-time testing in practical environments.
- Developing hybrid models that integrate physics-based and data-driven approaches.
- Exploring multi-modal data fusion for enhanced classification.

---
## Setup and Requirements
**Dependencies:**
- Python 3.8+
- TensorFlow / PyTorch
- NumPy
- Matplotlib
- SciPy
- OpenCV

**Installation:**
```bash
pip install -r requirements.txt
```

---
## Usage
1. Clone the repository:
```bash
git clone https://github.com/username/project_name.git
```
2. Navigate to the project directory:
```bash
cd project_name
```
3. Run the training script:
```bash
python train_model.py
```
4. Evaluate results:
```bash
python evaluate.py
```

---
## License
MIT License  
See `LICENSE` for details.

