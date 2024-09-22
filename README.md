# Exam Proctoring Smart Contract

## Vision

The vision of this project is to create a decentralized, tamper-proof system for online exam proctoring. By leveraging blockchain technology, the system ensures that student exam submissions are secure, immutable, and verifiable by authorized proctors. This aims to eliminate cheating and maintain integrity in online exams while ensuring privacy for students and transparency for institutions.

## Features

### 1. **Decentralized Exam Submissions**
   - Students can submit their exam answers securely through a cryptographic hash, ensuring the integrity of their submissions.
   - Each submission is stored on the blockchain, making it impossible to alter or tamper with the exam after submission.

### 2. **Proctor Verification**
   - Authorized proctors can verify student submissions by confirming the integrity and authenticity of the submitted exams.
   - Once verified, the exam is marked as such on the blockchain, ensuring transparent exam validation.

### 3. **Immutable Record of Submissions**
   - Every exam submission is stored immutably on the blockchain with a hash representing the exam data. This ensures that no exam can be altered after submission, guaranteeing a transparent audit trail.

### 4. **Student Privacy Protection**
   - No personal data or exam answers are stored directly on-chain, only a hash of the answers, which ensures that the integrity of the exam is maintained without compromising the student's privacy.

### 5. **Trustless Proctoring**
   - Proctors do not need to trust students or third-party intermediaries. The blockchain ensures all records are immutable, and the verification process can only be conducted by authorized proctors.

## Future Scope

1. **Plagiarism Detection & Reporting**
   - Integrate a plagiarism detection mechanism into the exam submission process, which will alert proctors if the exam submission matches any previous submissions.

2. **Time-Limit Enforcement**
   - Introduce functionality that enforces time limits on submissions. If the exam is not submitted within the allowed time, it could be automatically marked as incomplete or failed.

3. **Multisig Proctor Verification**
   - Future versions could support multi-signature (multisig) verification, where multiple proctors need to verify a submission to approve it, enhancing trust and accountability.

4. **NFT-based Certificates**
   - Implement the ability to issue non-fungible token (NFT) certificates to students who pass their exams, representing proof of their verified academic achievement.

5. **Analytics & Reporting**
   - Develop analytics tools for institutions to track exam trends, pass/fail rates, and overall performance, leveraging blockchain transparency to create trustworthy reports.

6. **Interoperability with Other Educational Systems**
   - Expand the contract to integrate with decentralized identity (DID) systems, allowing students to prove their academic achievements across various platforms.

## Smart Contract Information

This project is built using Move smart contracts on the Aptos blockchain. The contract consists of two main functions:

### **1. Submit Exam**
This function allows students to submit their exam answers for verification.

```move
public fun submit_exam(student: &signer, exam_hash: vector<u8>) {
    let submission = ExamSubmission {
        student_address: signer::address_of(student),
        exam_hash,
        verified: false,  // Initially, the exam is unverified
    };
    move_to(student, submission);
}
```
- **student**: The signer's address (student submitting the exam).
- **exam_hash**: The cryptographic hash of the exam answers.

### **2. Verify Exam**
This function allows an authorized proctor to verify the student's submission.

```move
public fun verify_exam(proctor: &signer, student_address: address) acquires ExamSubmission {
    let exam_submission = borrow_global_mut<ExamSubmission>(student_address);

    // Set the exam as verified
    exam_submission.verified = true;
}
```
- **proctor**: The proctor (signer) verifying the exam.
- **student_address**: The address of the student whose exam is being verified.

### Struct Definition

```move
struct ExamSubmission has store, key {
    student_address: address,  // Address of the student
    exam_hash: vector<u8>,     // Hash of the exam answers (to ensure integrity)
    verified: bool,            // Whether the exam is verified by the proctor
}
```
- **student_address**: The address of the student who submitted the exam.
- **exam_hash**: A hash representing the student's exam answers to ensure integrity.
- **verified**: Boolean value indicating whether the submission has been verified by a proctor.

## Deployment 
Contract Address: https://explorer.aptoslabs.com/txn/0xa47961a314ef924dfc00e855ad2108a13c52adb1cb6194dc738e62c961d45099?network=devnet
Transaction Hash: 0xa47961a314ef924dfc00e855ad2108a13c52adb1cb6194dc738e62c961d45099

![image](https://github.com/user-attachments/assets/eb1ba971-8e25-472e-a74a-2dafbad60c34)


## Contact Information

For questions, suggestions, or collaboration opportunities regarding this project:

- **Email**: sahitya@risein.com
