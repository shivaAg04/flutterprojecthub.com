name: Generate README

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Set up Dart
        uses: dart-lang/setup-dart@v1

      - name: Run Dart script
        run: dart run generate_readme.dart

      - name: Commit and push changes
        run: |
          git config --global user.name "GitHub Actions"
          git config --global user.email "actions@github.com"
          git add README.md
          git commit -m "🔄 Auto-update README.md" || echo "No changes to commit"
          git push
