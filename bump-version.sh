#!/bin/sh

# Ensure a version number is provided
if [ -z "$1" ]; then
  echo "Usage: ./bump-version.sh <new-version>"
  exit 1
fi

# Update package.json version using npm
npm version $1

# Read the new version from package.json
VERSION=$(cat package.json | jq -r .version)

# Commit the version bump
git add package.json
git commit -m "Bumped version to $VERSION"

# Create a new Git tag
git tag -a v$VERSION -m "Version $VERSION release"
git push origin main --tags

echo "Version updated to $VERSION!"
