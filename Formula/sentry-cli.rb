class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.31.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.31.1/sentry-cli-Darwin-universal"
    sha256 "862ba3fe2f1e1e52637a5dab8b9ef37eb6be4538eb5d62eb6e8ed0c6286710b7"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.31.1/sentry-cli-Linux-aarch64"
        sha256 "b778f23c676f7780a612ed3376c0a24186767b5fbb3cefd06865d42d385bedee"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.31.1/sentry-cli-Linux-armv7"
        sha256 "eca5e32636ecd71619d39e1eb0cca728e0899f27a2b310ae43430e743ccc9a7a"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.31.1/sentry-cli-Linux-x86_64"
        sha256 "df43e015e4c3a7227bb430853c74064562564fc715b77f85f825af74645b0d1f"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.31.1/sentry-cli-Linux-i686"
        sha256 "ea4c0de4048f74208cb18d69b62eb2f9dfb14317e27d5fd7d5a407a10472df58"
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
