# 📘 Digital Image Processing – Homework 3

This repository contains solutions to the **third assignment** of the *Digital Image Processing* course, implemented in **MATLAB**. This homework focuses on **frequency domain analysis, filtering, and image enhancement techniques**, including Fourier transform, custom filtering, high-frequency emphasis filtering, moiré pattern removal, and Laplacian filtering.

---

## 📁 Folder Structure

```
.
├── data/
│   └── q2/                     # Images for Fourier Transform (woman.tif, parrot.tif)
│   └── q3/                     # Images for filtering (char.tif)
│   └── q4/                     # Images for high-frequency emphasis filtering (chest.tif)
│   └── q5/                     # Images for moiré pattern removal (carmoire.tif)
│   └── q6/                     # Images for Laplacian filtering (bld.tif)
├── docs/
│   └── DIP_HW3.pdf              # Homework assignment PDF
├── src/
│   ├── Q2/
│   ├── Q3/
│   │   └── filter_function.m    # Custom filtering function
│   ├── Q4/
│   ├── Q5/
│   └── Q6/
```

> Note: There is no `results/` folder. Output images are saved inside the corresponding `src/Q*` folder by default, or you can create a `results/` folder if desired.

---

## 🧠 Problems Overview

### ✅ Q2 – Fourier Transform Analysis

- Load `woman.tif` and `parrot.tif`.
- Compute **Discrete Fourier Transform (DFT)** using `fft2`.
- Calculate and visualize **magnitude and phase spectra**.
- Reconstruct images using:
  - Only phase information.
  - Spectrum and phase from another image.
  - Mixed spectrum and phase.
- Analyze the effect of **scaling (1.5×)** and **spatial shifts (5% in X, Y, XY)** on the Fourier representation.
- Replace **lower-half frequency components** of one image with another and observe results.


---

### ✅ Q3 – Exploring Filter Types

- Implement a **custom MATLAB filter function** supporting:
  - Filter type: Low-Pass (LPF) / High-Pass (HPF)
  - Kernel type: Ideal / Butterworth / Gaussian
  - Specific filter parameters
- Load `char.tif` and apply:
  - Ideal LPF and HPF (D₀ = 15, 30, 50, 150, 400)
  - Butterworth filter (order = 2)
  - Gaussian filter
- Compare filtered images and their **frequency responses**.


---

### ✅ Q4 – High-Frequency Emphasis Filtering

- Load `chest.tif`.
- Apply **high-frequency emphasis filtering** to enhance X-ray images.
- Adjust intensity levels to improve contrast and visualize results.


---

### ✅ Q5 – Moiré Pattern Removal

- Load `carmoire.tif` and inspect its **frequency spectrum**.
- Design and apply **notch filters** to remove moiré patterns.
- Compare original and filtered images in both spatial and frequency domains.


---

### ✅ Q6 – Laplacian Filtering

- Load `bld.tif`.
- Apply the **Laplacian kernel** in the spatial domain:

```
-1  -1  -1
-1   8  -1
-1  -1  -1
```

- Compute and plot its **frequency response**.
- Apply the same filter in the **frequency domain**.
- Compare results and discuss differences.


---

## ▶️ How to Run

1. Open MATLAB.
2. Set the current folder to the corresponding `src/Q*` directory.
3. Run the main script for each question.

```matlab
run('main.m')  % for Q2, Q3, ..., Q6
```

4. Output images are saved in the same folder as the scripts by default.

---

## 📎 References

- Digital Image Processing, 4th Edition – Rafael C. Gonzalez & Richard E. Woods  
- MATLAB Documentation: https://www.mathworks.com/help/

