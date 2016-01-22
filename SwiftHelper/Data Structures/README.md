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
