class Question {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String? info; // shows explanation for the correct answer

  Question({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    this.info,
  });
}

List<Question> quizQuestions = [
  Question(
    question: "Which of the following is true about TCP and UDP?",
    options: [
      "Both TCP and UDP guarantee ordered delivery of packets",
      "UDP is connection-oriented while TCP is connectionless",
      "TCP provides reliability through acknowledgments and retransmissions, while UDP does not",
      "UDP is always faster than TCP in all network conditions",
    ],
    correctAnswerIndex: 2,
      info: "TCP is a connection-oriented protocol that ensures reliable, ordered delivery using acknowledgments and retransmissions. UDP is connectionless and does not provide these reliability mechanisms.",
  ),
  Question(
      question: "What does SQL stand for?",
      options: [
        "Structured Query Language",
        "Simple Query Language",
        "System Query Logic",
        "Sequential Query Language",
      ],
      correctAnswerIndex: 0,
      info: "SQL stands for Structured Query Language. It is the standard language used to manage and query relational databases.",
  ),
  Question(
      question: "Which data structure follows the principle of FIFO (First In First Out)?",
      options: [
        "Stack",
        "Queue",
        "Tree",
        "Graph",
      ],
      correctAnswerIndex: 1,
      info: "A Queue follows FIFO — the element that is inserted first is removed first. A Stack follows LIFO (Last In First Out).",
  ),
  Question(
      question: "What is the output of this expression in most programming languages? 5 / 2 (when both numbers are integers)",
      options: [
        "2.5",
        "2",
        "3",
        "2.0",
      ],
      correctAnswerIndex: 1,
      info: "When both operands are integers, most languages perform integer division and discard the decimal part. So 5 / 2 gives 2. To get 2.5, use floating-point numbers (e.g., 5 / 2.0).",
  ),
  Question(
      question: "What does OOP stand for?",
      options: [
        "Object Oriented Programming",
        "Object Oriented Process",
        "Operational Object Programming",
        "Ordered Object Programming",
      ],
      correctAnswerIndex: 0,
      info: "OOP stands for Object Oriented Programming. It is a programming approach based on objects and classes.",
  ),
  Question(
      question: "What is the key difference between 'Future' and 'Stream'?",
      options: [
        "Future can emit multiple values over time, Stream only one",
        "Stream can emit zero or more values over time, Future represents a single value (or error) that will be available later",
        "They are completely interchangeable",
        "Future is only for network calls, Stream is only for UI events",
      ],
      correctAnswerIndex: 1,
      info: "Stream can emit zero or more values over time, Future represents a single value (or error) that will be available later.",
  ),
  Question(
      question: "Which of the following has the best (fastest) time complexity?",
      options: [
        "O(n)",
        "O(n²)",
        "O(log n)",
        "O(n log n)",
      ],
      correctAnswerIndex: 2,
      info: "O(log n) grows the slowest, so it is the most efficient. Order from best to worst: O(log n) < O(n) < O(n log n) < O(n²)",
  ),
  Question(
      question: "Which command is used to retrieve data from a database table?",
      options: [
        "GET",
        "SELECT",
        "FETCH",
        "RETRIEVE",
      ],
      correctAnswerIndex: 1,
      info: "The SELECT statement is used in SQL to fetch/retrieve data from one or more tables.",
  ),
  Question(
      question: "Which of the following is not a type of operating system?",
      options: [
        "Batch Operating System",
        "Time-Sharing Operating System",
        "Distributed Operating System",
        "Compiler Operating System",
      ],
      correctAnswerIndex: 3,
      info: "Batch, Time-Sharing, and Distributed are types of operating systems. A Compiler is not an OS — it is a software tool that converts high-level code into machine code.",
  ),
  Question(
      question: "What does HTTP stand for?",
      options: [
        "HyperText Transfer Protocol",
        "High Transfer Text Protocol",
        "Hyperlink Transfer Protocol",
        "High Text Transfer Protocol",
      ],
      correctAnswerIndex: 0,
      info: "HTTP stands for HyperText Transfer Protocol. It is the protocol used for transferring web pages on the internet.",
  ),
  Question(
      question: "Which of the following is a volatile memory?",
      options: [
        "Hard Disk",
        "ROM",
        "RAM",
        "SSD",
      ],
      correctAnswerIndex: 2,
      info: "RAM (Random Access Memory) is volatile, meaning it loses all data when power is turned off. Hard Disk, ROM, and SSD are non-volatile memories that retain data even without power.",
  ),
  // more number of Questions can be added here...
];