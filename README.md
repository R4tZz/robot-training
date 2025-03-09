# Test Automation Training with Robot Framework & Playwright

---

## **Day 1: Introduction & Basics** (Duration: 6-7 hours)

### **Slide 1: Introduction to Test Automation** (Duration: 30 mins)

- What is test automation?
- Benefits and challenges
- Where Robot Framework fits in the automation landscape

**Discourse:**
Test automation is the process of using software to control the execution of tests, compare actual outcomes with expected outcomes, and generate reports. It helps reduce manual effort, increase test coverage, and improve the reliability of software testing. However, automation comes with challenges, such as maintenance, initial setup costs, and selecting the right tools. Robot Framework is a powerful tool that simplifies test automation by providing a keyword-driven approach that is easy to understand, even for those with little programming experience.

### **Slide 2: Introduction to Robot Framework** (Duration: 1 hour)

- What is Robot Framework?
- Key features and ecosystem
- Installation and setup (Python, pip, Robot Framework, Browser library)

**Discourse:**
Robot Framework is an open-source test automation framework that is widely used for acceptance testing. It is highly extensible, supporting multiple test libraries, including Selenium and Playwright. It is written in Python and supports both keyword-driven and data-driven testing. To get started, we need to install Python, then install Robot Framework and the Browser library using pip. We also initialize Playwright to download browser drivers.

### **Slide 3: Running Your First Test** (Duration: 1 hour)

- Basic test structure
- How to execute a test case
- Understanding test logs and reports

**Discourse:**
A Robot Framework test consists of sections: Settings, Variables, Test Cases, and Keywords. The simplest test opens a browser, navigates to a URL, and verifies a page element. We execute tests using the `robot` command, and logs/reports are automatically generated in an easy-to-read format, helping us debug issues.

### **Slide 4: Test Case Structure in Robot Framework** (Duration: 1 hour)

- Sections: **_Settings_**, **_Variables_**, **_Test Cases_**, **_Keywords_**
- Tags, documentation, and logging

**Discourse:**
Robot Framework organizes tests into structured sections. Settings define dependencies, Variables store reusable values, Test Cases define steps to execute, and Keywords enable reusable functions. Proper structuring improves readability and maintainability. Tags help categorize tests, and logging ensures detailed output for debugging.

### **Slide 5: Browser Automation with Playwright** (Duration: 1 hour)

- Introduction to Browser library
- Launching browsers and navigating pages
- Interacting with elements (click, type, select, etc.)

**Discourse:**
The Playwright-based Browser library enables web automation with modern browser support. We can launch browsers, navigate pages, and interact with elements using keywords like `Click` and `Fill Text`. This library offers better handling of modern dynamic web pages compared to Selenium.

### **Slide 6: Debugging & Reporting** (Duration: 1.5 mins)

- Logs and reports
- Debugging techniques
- Screenshots and video recording
  **Discourse:**
  Robot Framework generates comprehensive logs and reports, making debugging easier. We can take screenshots, record videos, and use `Log` keywords to capture additional details. Debugging techniques include using `Pause Execution`, inspecting element locators, and increasing wait times.

---

## **Day 2: Intermediate Concepts & Best Practices**

### **Slide 7: Variables & Data Structures**

- Scalar, list, and dictionary variables
- Using variables for dynamic test data

**Discourse:**
Variables enhance test reusability by storing values that can be referenced throughout test cases. We use scalar variables for single values, lists for collections, and dictionaries for structured data. Variables help make tests dynamic and easier to maintain.

### **Slide 8: Custom Keywords & Functions**

- Creating reusable keywords
- Using user-defined keywords with parameters

**Discourse:**
Custom keywords allow us to abstract repetitive tasks into reusable functions. This enhances test clarity and modularity. We can also pass parameters to these keywords to make them more flexible and reusable.

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
