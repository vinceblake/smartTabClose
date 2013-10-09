smartTabClose
=============

WHAT IT DOES:

1) This script looks for a file called Whitelist.txt in the folder from which it is run. If it doesn't find the file, it does nothing.

2) If it finds the file, it reads each line. All URLs containing even one of the strings therein are whitelisted. ALL others are blacklisted.

3) Finally, it identifies whether the user has any IE tabs/windows open to blacklisted URLs. If it finds any, it closes them.


EXAMPLE WHITELIST:

google

yahoo.com


In the above example, 
- Any URL containing the word "google" would remain open after the script finishes. Google.com, Google.net, website.com/google, etc. are all safe.
- ONLY Yahoo.com addresses would be safe. Tabs open to yahoo.net or Yahoo2.com would be closed.
