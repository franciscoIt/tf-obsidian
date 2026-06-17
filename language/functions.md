# String

| Function                        | Description                         | Example                                             |
| ------------------------------- | ----------------------------------- | --------------------------------------------------- |
| `upper(str)`                    | Converts to uppercase               | `upper("hello")` → `"HELLO"`                        |
| `lower(str)`                    | Converts to lowercase               | `lower("HELLO")` → `"hello"`                        |
| `trimspace(str)`                | Removes leading/trailing whitespace | `trimspace(" hi ")` → `"hi"`                        |
| `chomp(str)`                    | Removes trailing newlines           | `chomp("hi\n")` → `"hi"`                            |
| `replace(str, search, replace)` | Replaces substring                  | `replace("a-b-c", "-", "_")` → `"a_b_c"`            |
| `split(sep, str)`               | Splits string into list             | `split(",", "a,b,c")` → `["a","b","c"]`             |
| `join(sep, list)`               | Joins list into string              | `join(", ", ["a","b"])` → `"a, b"`                  |
| `substr(str, offset, length)`   | Extracts substring                  | `substr("hello", 0, 3)` → `"hel"`                   |
| `startswith(str, prefix)`       | Checks prefix                       | `startswith("hello", "he")` → `true`                |
| `endswith(str, suffix)`         | Checks suffix                       | `endswith("hello", "lo")` → `true`                  |
| `format(fmt, args...)`          | Printf-style formatting             | `format("Hello, %s!", "world")` → `"Hello, world!"` |
| `formatlist(fmt, list)`         | Format applied to a list            | `formatlist("-%s", ["a","b"])` → `["-a","-b"]`      |
| `regex(pattern, str)`           | Regex match, returns captures       | `regex("(\\w+)@", "a@b.com")`                       |
| `regexall(pattern, str)`        | All regex matches                   | Returns list of all matches                         |
# Numeric

| Function              | Description               | Example                      |
| --------------------- | ------------------------- | ---------------------------- |
| `abs(num)`            | Absolute value            | `abs(-5)` → `5`              |
| `ceil(num)`           | Round up                  | `ceil(1.2)` → `2`            |
| `floor(num)`          | Round down                | `floor(1.9)` → `1`           |
| `max(a, b, ...)`      | Largest number            | `max(3, 1, 5)` → `5`         |
| `min(a, b, ...)`      | Smallest number           | `min(3, 1, 5)` → `1`         |
| `pow(base, exp)`      | Exponentiation            | `pow(2, 8)` → `256`          |
| `signum(num)`         | Sign of number (-1, 0, 1) | `signum(-3)` → `-1`          |
| `log(num, base)`      | Logarithm                 | `log(16, 2)` → `4`           |
| `parseint(str, base)` | Parse string as integer   | `parseint("FF", 16)` → `255` |
# Collection

| Function                    | Description                    | Example                                     |
| --------------------------- | ------------------------------ | ------------------------------------------- |
| `length(val)`               | Length of list/map/string      | `length(["a","b"])` → `2`                   |
| `tolist(val)`               | Converts to list               |                                             |
| `toset(val)`                | Converts to set (deduplicates) | `toset(["a","a","b"])` → `{"a","b"}`        |
| `tomap(val)`                | Converts to map                |                                             |
| `flatten(list)`             | Flattens nested lists          | `flatten([[1,2],[3]])` → `[1,2,3]`          |
| `compact(list)`             | Removes empty strings          | `compact(["a","","b"])` → `["a","b"]`       |
| `distinct(list)`            | Removes duplicates             | `distinct(["a","a","b"])` → `["a","b"]`     |
| `sort(list)`                | Sorts a list                   | `sort(["c","a","b"])` → `["a","b","c"]`     |
| `reverse(list)`             | Reverses a list                | `reverse([1,2,3])` → `[3,2,1]`              |
| `concat(lists...)`          | Merges lists                   | `concat([1,2],[3,4])` → `[1,2,3,4]`         |
| `slice(list, start, end)`   | Sublist                        | `slice([1,2,3,4], 1, 3)` → `[2,3]`          |
| `contains(list, value)`     | Checks membership              | `contains(["a","b"], "a")` → `true`         |
| `index(list, value)`        | Index of element               | `index(["a","b"], "b")` → `1`               |
| `element(list, index)`      | Get element by index (wraps)   | `element(["a","b","c"], 4)` → `"b"`         |
| `chunklist(list, size)`     | Split into chunks              | `chunklist([1,2,3,4], 2)` → `[[1,2],[3,4]]` |
| `zipmap(keys, values)`      | Creates map from two lists     | `zipmap(["a","b"],[1,2])` → `{a=1, b=2}`    |
| `keys(map)`                 | List of map keys               | `keys({a=1, b=2})` → `["a","b"]`            |
| `values(map)`               | List of map values             | `values({a=1, b=2})` → `[1,2]`              |
| `lookup(map, key, default)` | Safe map lookup                | `lookup({a=1}, "b", 0)` → `0`               |
| `merge(maps...)`            | Merges maps                    | `merge({a=1},{b=2})` → `{a=1, b=2}`         |
|                             |                                |                                             |
# Type Conversion Functions

| Function                 | Description                                         |
| ------------------------ | --------------------------------------------------- |
| `tostring(val)`          | Converts to string                                  |
| `tonumber(val)`          | Converts to number                                  |
| `tobool(val)`            | Converts to boolean                                 |
| `type(val)`              | Returns the type as a string (useful for debugging) |
| `can(expression)`        | Returns `true` if expression doesn't error          |
| `try(expr1, expr2, ...)` | Returns first non-erroring expression               |
|                          |                                                     |
# Encoding Functions

|Function|Description|Example|
|---|---|---|
|`base64encode(str)`|Base64 encodes a string||
|`base64decode(str)`|Decodes a Base64 string||
|`base64gzip(str)`|Gzips and Base64 encodes||
|`jsonencode(val)`|Encodes value to JSON string|`jsonencode({a=1})` → `"{\"a\":1}"`|
|`jsondecode(str)`|Decodes JSON string to value||
|`yamlencode(val)`|Encodes to YAML||
|`yamldecode(str)`|Decodes YAML to value||
|`urlencode(str)`|URL-encodes a string||
|`textencodebase64(str, enc)`|Encode text with charset then base64||

---

#### Filesystem Functions

These are evaluated at **plan/apply time** relative to where Terraform is run.

|Function|Description|
|---|---|
|`file(path)`|Reads file contents as a string|
|`filebase64(path)`|Reads file and Base64-encodes it|
|`filemd5(path)`|MD5 hash of a file|
|`filesha256(path)`|SHA-256 hash of a file|
|`fileset(path, pattern)`|Set of file paths matching a glob|
|`templatefile(path, vars)`|Renders a template file with variables|

---

# Hash & Crypto Functions

|Function|Description|
|---|---|
|`md5(str)`|MD5 hash|
|`sha1(str)`|SHA-1 hash|
|`sha256(str)`|SHA-256 hash|
|`sha512(str)`|SHA-512 hash|
|`bcrypt(str, cost)`|Bcrypt hash|
|`uuid()`|Generates a random UUID (changes each plan!)|
|`uuidv5(namespace, name)`|Deterministic UUID|
|`rsadecrypt(ciphertext, key)`|RSA decryption|
# Date & Time Functions

|Function|Description|Example|
|---|---|---|
|`timestamp()`|Current UTC timestamp (RFC 3339)|`"2024-01-15T10:00:00Z"`|
|`timeadd(time, duration)`|Adds duration to timestamp|`timeadd("2024-01-01T00:00:00Z", "24h")`|
|`timecmp(a, b)`|Compares two timestamps (-1, 0, 1)||
|`formatdate(format, time)`|Formats a timestamp|`formatdate("DD MMM YYYY", timestamp())`|
|`plantimestamp()`|Timestamp fixed at plan start|Stable within a plan|

# IP Network Functions

| Function                              | Description                  |
| ------------------------------------- | ---------------------------- |
| `cidrhost(prefix, hostnum)`           | Calculates host IP from CIDR |
| `cidrnetmask(prefix)`                 | Subnet mask from CIDR        |
| `cidrsubnet(prefix, newbits, netnum)` | Calculates a subnet          |
| `cidrsubnets(prefix, newbits...)`     | Multiple subnets at once     |
| `cidrcontains(cidr, ip)`              | Checks if IP is within CIDR  |
