# Homebrew formula for the Nanny CLI.
#
# This file lives at homebrew/nannyd.rb in the nanny repo for source tracking.
# For the tap to work, copy it to the Formula/ directory of the
# nanny-run/homebrew-nanny GitHub repository:
#
#   https://github.com/nanny-run/homebrew-nanny/blob/main/Formula/nannyd.rb
#
# After tagging v0.1.0, update the sha256 values using:
#   curl -fsSL <url> | shasum -a 256
#   NOTE: SHA256 values are updated automatically by CI, no manual steps required.

class Nannyd < Formula
  desc "Execution boundary for autonomous AI agents"
  homepage "https://nanny.run"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nanny-run/nanny/releases/download/v#{version}/nanny-macos-arm64.tar.gz"
      sha256 "003bb7f7ca8624021931ca7678c7bc31e5bb610babb86722148be50c9f51b752"
    end

    on_intel do
      url "https://github.com/nanny-run/nanny/releases/download/v#{version}/nanny-macos-x86_64.tar.gz"
      sha256 "118d33f43fd4babb1508a57aeffe09418ee5ea41e2a51ab13b90a17ce6d1a83a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nanny-run/nanny/releases/download/v#{version}/nanny-linux-x86_64.tar.gz"
      sha256 "46728e3f2782c454e459c4401e1399e937aae2f269e3ce6a7191112e7888a6a9"
    end
  end

  def install
    bin.install "nanny"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nanny --version")
  end
end
