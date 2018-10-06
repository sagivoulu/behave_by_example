$date = Get-Date -UFormat "%Y-%m-%d %H-%M-%S"
# Run behave test, and output json, text & allure json report
behave -f json.pretty                             -o "reports\archive\$date\behave_json_report\report.json" `
       -f plain                                   -o "reports\archive\$date\text_report\report.txt"  `
       -f allure_behave.formatter:AllureFormatter -o "reports\archive\$date\allure_data";

# Generate an allure HTML report
.\tools\allure\bin\allure generate reports\archive\$date\allure_data --output reports\archive\$date\allure_report --clean;

# Convert the behave json report to cucumber json report (and delete log file if created)
New-Item -ItemType Directory -Force -Path .\reports\archive\$date\cucumber_json_report
python -m behave2cucumber --infile .\reports\archive\$date\behave_json_report\report.json --outfile .\reports\archive\$date\cucumber_json_report\report.json;
$FileName = "behave2cucumber.log"
if (Test-Path $FileName) { Remove-Item $FileName }

# Generate a cucumber-sandwich HTML report
java -jar .\tools\cucumber-sandwich.jar -n `
    -f .\reports\archive\$date\cucumber_json_report      `
    -o .\reports\archive\$date\cucumber_sandwich_report;

# Create hard symbolic link of the newly generated reports at the reports directory
cmd /J mklink "reports\archive\$data" reports\current_report