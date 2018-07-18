require "google_drive"


session = GoogleDrive::Session.from_config("config.json")

ws = session.spreadsheet_by_key("pz7XtlQC-PYx-jrVMJErTcg").worksheets[0]
