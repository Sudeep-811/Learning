
/*
-Terraform allows us to set wide varity of log levels foe getting detailed logs for debugging purpose. 
-TF has detailed logs that you can enable by setting the TF_LOG environment variable to one of the following values: TRACE,< DEBUG,< INFO,< WARN,< ERROR. (decreasing order of verbosity)
-Storing the logs in a file can be done by setting the TF_LOG_PATH environment variable to the path of the file where you want to store the logs.
*/

resource "local_file" "foo" {
  content  = "foo!"
  filename = "${path.module}/foo.txt"
}

/*
SYNTAXs--

set TF_LOG=INFO
set TF_LOG=TRACE

set TF_LOG_PATH=terraform.txt


*/
