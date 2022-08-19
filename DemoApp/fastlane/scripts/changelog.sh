versionStringFrom=$(git tag --list --sort=-version:refname "*" | head -n 2 | tail -n 1)
versionStringTo=$(git tag --list --sort=-version:refname "*" | head -n 1)
pr_changelog --format pretty refs/tags/$versionStringFrom refs/tags/$versionStringTo