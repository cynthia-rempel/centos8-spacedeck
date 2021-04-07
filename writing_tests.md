## Generating list of functions to test

Run in spacedeck-open folder

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

## Writing tests

https://jestjs.io/docs/getting-started
