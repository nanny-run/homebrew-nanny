class Nannyd < Formula
  desc "Execution boundary for autonomous AI agents"
  homepage "https://nanny.run"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nanny-run/nanny/releases/download/v#{version}/nanny-macos-arm64.tar.gz"
      sha256 "fd9ea211e01043bf0c48763bc2d3d4c77b076a76e40e2828bea6ad0ced70853c"
    end

    on_intel do
      url "https://github.com/nanny-run/nanny/releases/download/v#{version}/nanny-macos-x86_64.tar.gz"
      sha256 "0e25534bdd31df8219a276199e895a52cebefdf7ea34681f27dd8e0a6adc2d57"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nanny-run/nanny/releases/download/v#{version}/nanny-linux-x86_64.tar.gz"
      sha256 "da22f54b9ed5c05d1ce4bba21917e337933554a2b5d930d8c2e2c48a79ff783b"
    end
  end

  def install
    bin.install "nanny"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nanny --version")
  end
end
