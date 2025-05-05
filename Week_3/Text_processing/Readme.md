# Text_processing Commands

Some of the text processing commands, i have already mentioned while lerning other module. Here, I am adding commands that i have seen but not learned properly.

## `awk`

* `awk` is a programming language that is powerful for pattern scanning and processing. It is mainly used for working with columns in text files.

* It is mainly used for working with columns.

* To understand awk better, I have created a sample log file and performed various `awk` operations on it.

**Print a log file.**

```bash
awk '{print}' app.log
```

**Print columns of that log file (print operation)**

```bash
awk '{print $1, $4}' app.log | head -n 6
```
> Here, I wanted to print the first and fourth column. To mention which column we wanna see, we use `$` sign before column number.

🖥️ Example output:

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_3/Screenshots/awk.png)


**Print the lines which provides only information (Filter operation)**

```bash
awk '/INFO/ {print $1, $3, $4}' app.log
```

> Here, I have used the filter operation. To use filter we can put our choice in between two slashes `/<filter>/`.

🖥️ Example output:

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_3/Screenshots/awk1.png)


**Print the number of lines that shows information (count operation)**

```bash
awk '/INFO/ {count++} END {print "The number of INFO lines: "count}' app.log
```

> Here, I have used the filter operation along with count operation. To count the occurance of our choice  we use `{count++}`.

🖥️ Example output:

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_3/Screenshots/awk2.png)

**Let me try with another example**

Find the number of warnings came in the app.log and what are the messages for it.

```bash
awk ' /WARNING/ {count++, print} END {print "The number of warnings are : " count}' app.log
```

🖥️ Example output:

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_3/Screenshots/awk3.png)
