cask "dimmer" do
  version "1.0"
  sha256 "57a398063b74c3b3662b521a945f9147b66981cbbe926d03017f080909f7a78a"

  url "https://github.com/viktor-workflow/Dimmer/releases/download/v#{version}/Dimmer.zip"
  name "Dimmer"
  desc "Menu bar app that dims the screen below the minimum brightness"
  homepage "https://github.com/viktor-workflow/Dimmer"

  depends_on macos: ">= :ventura"

  app "Dimmer.app"

  # Dimmer is ad-hoc signed, not notarised: remove the quarantine flag so it opens.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Dimmer.app"]
  end

  zap trash: "~/Library/Preferences/local.viktor.dimmer.plist"
end
