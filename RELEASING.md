# Releasing mountain_view

1. Update `lib/mountain_view/version.rb` file accordingly.
2. Update `CHANGELOG.md` to reflect the changes since last release.
3. Commit changes. There shouldn’t be code changes, and thus CI doesn’t need to
   run, you can then add “[ci skip]” to the commit message.
4. Tag the release: `git tag vVERSION`
5. Push changes: `git push --tags`
6. Build and publish the gem:

   ```bash
   gem build mountain_view.gemspec
   gem push mountain_view-*.gem
   ```

7. Announce the new release, making sure to say “thank you” to the contributors
   who helped shape this version!
