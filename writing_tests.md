## Generating list of functions to test

Run in spacedeck-open folder

Start by generating a list of methods to test

```
grep -R ^function\  * | \
    grep -v module | \
    grep \{ | \
    grep -v \= | \
    sed 's/.js.function/.js/' | \
    sed 's/.$//' | \
    sed 's/\ *//g' | \
    sed 's/.js/.js\ /' > __tests__/test_list.txt
```

Next, draft some test files

```
cat __tests__/test_list.txt | \
    awk '{print $1,$2,$1}' | \
    sed 's/js$/test.js/' | \
    sed 's/).*\//) /' | \
    awk '{print "echo const "$3" = require(../"$1"); >> "$3"\necho test("$2", () => { >> "$3"\necho   expect("$2").toBe(); >> "$3"\necho}); >> "$3}' | \
    sed 's/echo\ /echo\ \"/' | \
    sed 's/\ >/\"\ >/' > __tests__/draft-tests.sh
cd __tests__
bash -x draft-tests.sh
```
## Writing tests

https://jestjs.io/docs/getting-started
