class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.25.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.25.0/sentry-cli-Darwin-universal"
    sha256 "26b6f0c65306f3d94a14e6c596b0f711afaf5706dd58160a20fe711964fea3ed"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.25.0/sentry-cli-Linux-aarch64"
        sha256 "541e3830178ed6cf65bcd5e754bfd83c988e20a403f35fadb560f65c1dd9d99f"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.25.0/sentry-cli-Linux-armv7"
        sha256 "fc2273863369e4ba436dceb049b9c8277662238195f104eb859a6d57b050c592"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.25.0/sentry-cli-Linux-x86_64"
        sha256 "e2bd9a7ba8cb22b2a005fa91bd8d78c4fad3cb7df8ddc13ee9da91367a7812e6"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.25.0/sentry-cli-Linux-i686"
        sha256 "9773005ee5d5e31e88b2a1cce68426683db29315e7e672e0b8088affe66a29f0"
      end
    else
      raise "Unsupported architecture"
    end
  else
      raise "Unsupported operating system"
  end
  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
