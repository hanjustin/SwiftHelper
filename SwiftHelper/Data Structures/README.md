## Requirements

- Swift 2.0+

## Example Usage

Initialization:

```swift
var orderedDictionary = OrderedDictionary(elements: (0, "Zero"), (1, "One"), (2, "Two"))
var anotherDictionary: OrderedDictionary = [(0, "Zero"), (1, "One"), (2, "Two")]
```

Modification with key:

```swift
orderedDictionary[key: 1] = "uno"
orderedDictionary[key: 2] = "II"

print(orderedDictionary[key: 0]) // => Optional("Zero")
print(orderedDictionary[key: 1]) // => Optional("uno")
print(orderedDictionary[key: 2]) // => Optional("II")
print(orderedDictionary[key: 3]) // => nil
```

Modification with index:

```swift
anotherDictionary[index: 1] = (3, "Tres")
anotherDictionary[index: 2] = (6, "VI")

print(anotherDictionary[index: 0]) // => (0, "Zero")
print(anotherDictionary[index: 1]) // => (3, "Tres")
print(anotherDictionary[index: 2]) // => (6, "VI")
print(anotherDictionary[index: 3]) // => fatal error: Array index out of range
```
