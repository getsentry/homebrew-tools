class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.38.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.38.2/sentry-cli-Darwin-universal"
    sha256 "d8fcbd334d351af28cddd159ebeadbbbfe5724126736cc1d259e0e1ab091ad15"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.38.2/sentry-cli-Linux-aarch64"
        sha256 "88c11b69a8ed971b6853faaa47cc27e3b6e559da28dee161dcbb9104752572e1"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.38.2/sentry-cli-Linux-armv7"
        sha256 "f9c158555af7aa83558187d1d6363f2456f10680781e65c2d9ca5ca4999376cf"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.38.2/sentry-cli-Linux-x86_64"
        sha256 "7e9f8493e2a2f3536f00b71820eff9799f7642e8a0589b1b0be5673cbf43832c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.38.2/sentry-cli-Linux-i686"
        sha256 "a1a2ed8a32d85bfb2e1b4900be5e6e1734fa8e562ea2fdc2361458347e0f24e4"
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
