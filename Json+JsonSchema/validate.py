import json
from jsonschema import validate
from jsonschema.exceptions import ValidationError

with open("quanly_khachhang.json", "r", encoding="utf-8") as f:
    data = json.load(f)

with open("quanly_khachhang_schema.json", "r", encoding="utf-8") as f:
    schema = json.load(f)

try:
    validate(instance=data, schema=schema)
    print(" JSON hợp lệ theo schema.")
except ValidationError as e:
    print(" JSON không hợp lệ:")
    print(e.message)
