```
grep -R ^function\  * | grep -v module | grep \{ | grep -v \= | sed 's/.js.function/.js/' | sed 's/.$//' > __tests__/test_list.txt
```
