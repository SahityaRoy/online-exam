module MyModule::ExamProctoring {

    use aptos_framework::signer;
    use std::vector;

    /// Struct representing a student's exam submission.
    struct ExamSubmission has store, key {
        student_address: address,  // Address of the student
        exam_hash: vector<u8>,     // Hash of the exam answers (to ensure integrity)
        verified: bool,            // Whether the exam is verified by the proctor
    }

    /// Function to submit an exam for verification.
    public fun submit_exam(student: &signer, exam_hash: vector<u8>) {
        let submission = ExamSubmission {
            student_address: signer::address_of(student),
            exam_hash,
            verified: false,  // Initially, the exam is unverified
        };
        move_to(student, submission);
    }

    /// Function for a proctor to verify the student's exam.
    public fun verify_exam(proctor: &signer, student_address: address) acquires ExamSubmission {
        let exam_submission = borrow_global_mut<ExamSubmission>(student_address);

        // Set the exam as verified
        exam_submission.verified = true;
    }
}
