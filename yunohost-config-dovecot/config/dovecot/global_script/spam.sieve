require ["fileinto"];
# rule:[SPAM]
if anyof (header :contains "X-DSPAM-Result" "Spam")
{
    fileinto "SPAM";
    stop;
}
