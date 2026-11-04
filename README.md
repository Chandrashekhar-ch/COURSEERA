# Simple Interest Calculator

## Project Description
This project is a simple interest calculator developed using Bash scripting. It calculates the simple interest based on the principal amount, rate of interest, and time period entered by the user.

## Formula
Simple Interest = (Principal × Rate × Time) / 100

Where:
- **Principal (P):** The initial amount of money.
- **Rate (R):** The annual rate of interest.
- **Time (T):** The time period in years.

## How to Run

1. Clone the repository:
   ```bash
   git clone YOUR_REPOSITORY_URL
   ```
2. Navigate to the project directory:
   ```bash
   cd YOUR_REPOSITORY_NAME
   ```
3. Run the script:
   ```bash
   bash simple-interest.sh
   ```

The calculator also accepts values as command-line arguments:

```bash
bash simple-interest.sh 1000 5 2
```

Arguments are principal, annual rate of interest, and time in years. Values must be non-negative numbers. Results are rounded and displayed to two decimal places. Use `--help` to display the command syntax.

## Example

**Input:**
- Principal: 1000
- Rate of Interest: 5
- Time: 2 years

**Output:**
- Simple Interest: 100.00

## Tests

Run the regression tests from the project root:

```bash
bash tests/test_simple_interest.sh
```

## Technologies Used
- Bash Shell Scripting
- Git
- GitHub

## Author
Your Name

## License
This project is licensed under the Apache License 2.0.
