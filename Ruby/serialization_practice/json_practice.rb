require 'json'

obj = { a: 'always', b: 'be', c: 'closing', d: [1, 2, 3] }
p obj
serialized_obj = obj.to_json
p JSON.parse(serialized_obj)
