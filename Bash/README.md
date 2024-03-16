# List of exercises
## Exercise 1
You need to show only files that don't repeat the filename, so you ignore extension.

For example:
```
foo.mp3|bar.txt|baz.mp3
wub.mp3|wub.mp3|wub.mp3|wub.txt|wub.png
quux.mp3|quux.txt|thud.mp3
```
- Line 1 all filenames are unique
- Line 2 all filenames repeat so all are ignored
- Line 3 all quux are ignored cause they repeat

Result will be:
```
foo.mp3|bar.txt|baz.mp3
thud.mp3
```
Solution: [Exercise 1](exercise-1.sh)


## Exercise 2

Complete the function/method so that it returns the url with anything after the anchor (#) removed.

Examples:
```
"www.example.com#about" --> "www.example.com"
"www.example.com?page=1" -->"www.example.com?page=1"
```

Solution: [Exercise 2](exercise-2.sh)
