# Fractional Fourier Transform and PINNs for ToF Material Classification
![alt text](https://github.com/Navtegh/Fractional-Fourier-Transform-and-PINNs-for-ToF-Material-Classification/blob/main/Images/Method.png)
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

  
 ![alt text](https://github.com/Navtegh/Fractional-Fourier-Transform-and-PINNs-for-ToF-Material-Classification/blob/main/Results_12_14.png)

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
1. Install MATLAB
2. Install Deep Learning Toolbox, Optimization Toolbox and Partial Differential Equation Toolbox.
---

## Usage
1. Clone the repository:
```bash
git clone [https://github.com/Navtegh/Fractional-Fourier-Transform-and-PINNs-for-ToF-Material-Classification.git]
```
2. Navigate to the project directory:
   /Ffrt_learnable_a/
3. Run the training and evaluation script:
   mainfile.m



