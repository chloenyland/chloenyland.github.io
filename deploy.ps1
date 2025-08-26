# Build the Jekyll site using your updated _config.yml and posts
bundle exec jekyll build

# Remove the old docs folder
Remove-Item -Recurse -Force docs

# Copy the new site into docs
Copy-Item -Recurse -Force _site docs

# Add .nojekyll to prevent GitHub from rebuilding
New-Item -ItemType File -Path docs/.nojekyll -Force

# Stage the updated docs folder and any other changes (like new posts)
git add docs _config.yml _posts

# Commit with a message
git commit -m "Deploy site updates"

# Push to GitHub
git push origin main
