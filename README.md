# Performance Comparison of PRESENT and GIFT Block Ciphers

## Abstract
Lightweight cryptography is essential for securing resource-limited devices like smart cards, RFID tags, sensor networks, and embedded systems. This project compares the performance of two lightweight block ciphers—**PRESENT** and **GIFT**—which use a Substitution-Permutation Network (SPN) structure. These ciphers are tested through available attack tools to evaluate their performance in terms of power consumption, cell area, and delay.


## Table of Contents
1. [Introduction](#introduction)
    - [1.1 Lightweight Cryptography](#lightweight-cryptography)
    - [1.2 Problem Definition](#problem-definition)
    - [1.3 Objectives](#objectives)
2. [Literature Survey](#literature-survey)
3. [Classification of Lightweight Cryptography](#classification-of-lightweight-cryptography)
    - [3.1 Asymmetric Key Cryptography](#asymmetric-key-cryptography)
    - [3.2 Symmetric Key Cryptography](#symmetric-key-cryptography)
4. [Implemented Block Cipher](#implemented-block-cipher)
5. [PRESENT Block Cipher](#present-block-cipher)
6. [GIFT Block Cipher](#gift-block-cipher)
7. [Tools Used](#tools-used)
8. [Results and Discussion](#results-and-discussion)
9. [Real-Time Applications](#real-time-applications)
10. [Conclusion](#conclusion)
11. [References](#references)

---

## 1. Introduction

The possibility of cyber-attacks, particularly in IoT environments, is ever-increasing. **Lightweight cryptography** plays a pivotal role in securing resource-limited devices, ensuring confidentiality, authentication, and data integrity without exhausting device resources like power and memory.

### 1.1 Lightweight Cryptography
Lightweight cryptography is designed for small devices with limited computational capabilities such as RFID tags and IoT devices. These devices typically have constraints like minimal battery life and processing power, necessitating efficient cryptographic algorithms.

### 1.2 Problem Definition
It is challenging for resource-limited environments to implement standard cryptographic algorithms due to their size, speed, and energy consumption. Lightweight ciphers offer a solution by using minimal memory, computing resources, and power, while still providing adequate security.

### 1.3 Objectives
- Survey the existing lightweight ciphers.
- Implement the identified ciphers on a common hardware platform using **Cadence** and **Xilinx Vivado** tools.
- Compare the performances of **PRESENT** and **GIFT** block ciphers based on hardware implementations (power, delay, and cell count).

---

## 2. Literature Survey
Various studies have demonstrated the implementation of lightweight ciphers, such as PRESENT and GIFT, on FPGA platforms. Performance evaluations include factors like area, power consumption, and encryption throughput. Previous research highlights that GIFT improves upon the PRESENT cipher in terms of efficiency and resistance to linear cryptanalysis.

---

## 3. Classification of Lightweight Cryptography

### 3.1 Asymmetric Key Cryptography
Asymmetric cryptography uses a public and private key pair. Examples include RSA and Diffie-Hellman. It is more secure but computationally expensive.

### 3.2 Symmetric Key Cryptography
Symmetric cryptography uses the same key for encryption and decryption. Block ciphers like AES, DES, and the lightweight ciphers PRESENT and GIFT fall under this category.

---

## 4. Implemented Block Cipher

### 4.1 Substitution-Permutation Network (SPN)
SPN block ciphers use a series of rounds involving substitution boxes (S-boxes) and permutation boxes (P-boxes) to encrypt data. SPN provides **confusion** and **diffusion** properties, ensuring data integrity and resistance to cryptanalysis.

---

## 5. PRESENT Block Cipher

The **PRESENT** block cipher is an ultra-lightweight SPN cipher, consisting of 31 rounds with a block size of 64 bits and a key size of either 80 or 128 bits. Each round consists of:
1. **S-box layer**: 16 S-boxes with 4-bit input/output.
2. **Permutation layer**: Bit permutation to mix the output bits.
3. **Round key addition**: XOR with the round key.

### Key Schedule
The 80-bit key is rotated, passed through an S-box, and XORed with a round counter to produce the round keys.

---

## 6. GIFT Block Cipher

**GIFT** is a lightweight SPN block cipher with two versions: **GIFT-64** (28 rounds) and **GIFT-128** (40 rounds). Both versions use a 128-bit key. Each round consists of:
1. **Sub-cells**: Applying a 4-bit S-box to every nibble.
2. **Perm-bits**: Permutation of the bits.
3. **Round key addition**: XOR with round key at specific positions.

---

## 7. Tools Used

### 7.1 Cadence
Cadence tools enable the design and verification of circuits, offering a complete environment for evaluating power, area, and performance.

### 7.2 Xilinx Vivado
Vivado is used for FPGA synthesis and analysis, with support for high-level synthesis and simulation of hardware description languages.

---

## 8. Results and Discussion

The simulation results for PRESENT and GIFT ciphers were obtained using both Cadence and Vivado tools. Key performance metrics include **power consumption**, **cell area**, and **timing delay**.

### Results Comparison (PRESENT vs GIFT):

| **Metric**        | **PRESENT** (Cadence) | **GIFT** (Cadence) |
|-------------------|-----------------------|--------------------|
| Dynamic Power (nW)| 878019.976             | 469520.832          |
| Cell Count        | 544                   | 396                |
| Timing Delay (ns) | 5.12                   | 4.75               |

**Key Findings**:
- GIFT consumes less power and has fewer cells compared to PRESENT.
- The dynamic power in Vivado is higher due to differences in the measurement setup.

---

## 9. Real-Time Applications

- **Internet of Things (IoT)**: Lightweight ciphers are essential for securing IoT devices with constrained resources.
- **Banking and E-commerce**: Lightweight cryptography ensures secure online transactions with minimal computational overhead.
- **Mobile Apps**: Secure communication and data encryption in mobile devices rely on lightweight encryption algorithms.

---

## 10. Conclusion

The **GIFT** block cipher demonstrates superior performance over **PRESENT**, particularly in power consumption and area efficiency. Its design is optimized for low-power, high-efficiency applications, making it suitable for IoT and embedded systems.

---

## 11. References

1. A. Bogdanov et al., “PRESENT: An Ultra-Lightweight Block Cipher,” 2007.
2. S. Banik et al., “GIFT: A Small Present Towards Reaching the Limit of Lightweight Encryption,” 2017.
3. H. Delfan Azari, P. V. Joshi, “Implementation of PRESENT Cipher on FPGA,” 2018.
4. L. Chom et al., “Comparison of AES and PRESENT Block Cipher,” 2019.
5. C. Da Silva et al., “Encryption of Test Data: Which Cipher is Better?” 2018.

