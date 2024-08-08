### Default separator
```sh
echo "1 2 3 4 5" | awk '{print $3}'
```

This command prints the third column (`3`) from the input string "1 2 3 4 5".

### custom separator
Yes, you can use a custom separator with `awk` using the `-F` option. Here’s an example:

```sh
echo "name:age:location" | awk -F ':' '{print $2}'
```

This command prints the second field (`age`) using `:` as the custom separator.


echo "name:age:location" | awk -F ':' '{for (i = 1; i <= NF; i++) print "Field " i ": " $i}'


# Debug

Yes, you can print all variables in `awk` to debug by using a loop to iterate through them. Here’s an example:

```sh
echo "name:age:location" | awk -F ':' '{for (i = 1; i <= NF; i++) print "Field " i ": " $i}'
```

