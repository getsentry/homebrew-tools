class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.75.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.75.2/sentry-cli-Darwin-universal"
    sha256 "17fa02c091c66dfd35e22766986d24176e3d95e3535bf957eb06478fbb9421e8"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.75.2/sentry-cli-Linux-aarch64"
        sha256 "96c04befc82ae68c275aecf433f4b354f2f153318ab4585612f330e85eccd679"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.75.2/sentry-cli-Linux-armv7"
        sha256 "0fe9e7c163bfe9285617cf05e33c94830cc2fe3353114910e0f8fb4c70aa3079"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.75.2/sentry-cli-Linux-x86_64"
        sha256 "58f103859e57435dac7672db75b471a091de8e65e3c8776978cdf5a752d1fccd"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.75.2/sentry-cli-Linux-i686"
        sha256 "5f0f2b8e08b78d18f1173b96aeb98bc2a099f639481c80c4808ae4f1b4ea825a"
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
