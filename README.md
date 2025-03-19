# Test Automation Training with Robot Framework

---

## **Day 1: Introduction & Basics**

### **Introduction to Test Automation**

- What is Test Automation?
- Benefits of Test Automation
- Challenges of Test Automation
- Test Automation Use Cases
- What is Robot Framework?

### **Installation and Setup**

- Python and UV package manager installation
- Add libraries to the virtual env

### **Robot Framework Basic Structure**

- Sections: **_Settings_**, **_Variables_**, **_Test Cases_**, **_Keywords_**
- Tags, documentation, and logging
- How to execute a test case
- Understanding test logs and reports

### **Introduction to the Browser Library in Robot Framework**

- Introduction to Browser library
- Launching browsers and navigating pages
- Interacting with elements (click, type, select, etc.)

### **Slide 6: Debugging & Reporting**

- Logs and reports
- Debugging techniques
- Screenshots and video recording

---

## **Day 2: Intermediate Concepts & Best Practices**

### **Variables & Data Structures**

- Types of variables: Scalar, list, dictionary, built-in, etc...
- Scope of variables

### **Custom Keywords & Functions**

- Creating reusable keywords
- Using user-defined keywords with parameters

### **Slide 9: Test Data & Parameterization**

- Using **_Test Templates_**
- Data-driven testing with CSV/Excel/YAML

**Discourse:**
Data-driven testing allows us to execute the same test case multiple times with different inputs. Test templates simplify test execution for multiple data points, while external files (CSV, Excel, YAML) help separate test data from logic, making maintenance easier.

### **Slide 10: Working with Assertions & Validations**

- Verifying page elements
- Using Robot Framework built-in keywords for validation

**Discourse:**
Assertions confirm expected test outcomes. Robot Framework provides built-in validation keywords like `Should Be Equal` and `Element Should Be Visible`. These help ensure application correctness and stability.

### **Slide 11: Project Structure & Best Practices**

- Organizing tests and resources
- Using external libraries and imports
- Best practices for maintainability

**Discourse:**
A well-structured project improves maintainability. Organizing test cases, separating resources, and following best practices like modularization and documentation enhance efficiency. External libraries extend functionality when needed.

---

## **Day 3: Advanced Topics & Project Work**

### **Slide 12: Handling Dynamic & Complex Elements**

- Dealing with iframes and shadow DOM
- Waiting strategies

**Discourse:**
Modern web applications contain dynamic elements like iframes and shadow DOM. Playwright’s `Wait For Elements State` helps handle these elements effectively. Using appropriate waiting strategies ensures stable tests.

### **Slide 13: Running Tests in CI/CD Pipelines**

- Running tests in GitHub Actions, Jenkins, or GitLab CI
- Headless execution and parallelization

**Discourse:**
CI/CD automation enables running tests on every code commit. Robot Framework integrates seamlessly with GitHub Actions, Jenkins, and GitLab CI. Running tests headlessly and in parallel speeds up execution time.

### **Slide 14: Debugging & Troubleshooting Advanced Issues**

- Handling flaky tests
- Improving test stability

**Discourse:**
Flaky tests fail inconsistently due to timing issues, network instability, or dynamic content. Using robust locators, proper waits, and retry mechanisms reduces flakiness and improves stability.

### **Slide 15: Final Hands-on Project**

- Trainees create their own test suite for a web application
- Best practices review and feedback

**Discourse:**
In this final hands-on project, trainees will build a complete test suite for a sample web application. They will apply the concepts learned, focusing on best practices and maintaining a structured test automation project. Feedback will be provided to ensure a solid foundation in test automation with Robot Framework and Playwright.
