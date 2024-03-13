class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.30.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.30.2/sentry-cli-Darwin-universal"
    sha256 "e8b4049d39d3df8884f16dee1e9ce8771ce86fba376273a40803111e35ca3a42"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.2/sentry-cli-Linux-aarch64"
        sha256 "93f85be33b9dd5c4317f9ac38b2739f85eae2ed36e65e23b2e6454d1ed6b9ea5"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.2/sentry-cli-Linux-armv7"
        sha256 "f807a7c8ed71f7ca9bd7fa2b3f208aef7fd1d717e4484bcc909d7f73299f8d27"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.2/sentry-cli-Linux-x86_64"
        sha256 "0c2b5a127498a36078c5e66b0696f0f8ed3e7464ff821e108bf5c48cdd5e90cf"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.2/sentry-cli-Linux-i686"
        sha256 "b9291f5836d781ccc020ffe67bbd8ea4507d376c2b5dfeccd3693f7f3c226e22"
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
