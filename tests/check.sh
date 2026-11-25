
#!/usr/bin/env bash

# README Title Validation Test
# This test passes only if the first line of README.md
# starts with a Markdown H1 heading (# followed by a space).

first_line=$(head -n 1 README.md)

if [[ "$first_line" == "# "* ]]; then
    echo "✅ SUCCESS: README.md has a valid title: $first_line"
else
    echo "❌ FAILED: The first line of README.md must start with '# ' (a hash followed by a space)."
    echo "   Current first line: $first_line"
    exit 1
fi
