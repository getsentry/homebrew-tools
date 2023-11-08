class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.21.3"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.21.3/sentry-cli-Darwin-universal"
    sha256 "4aa578b939e889ade56f725e598a5b2b305c7b86ca60131c7677ac1cfd74386c"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.3/sentry-cli-Linux-aarch64"
        sha256 "ddee3ac95e065ca73108266994dc4778a057c270c61a05c304c3fd07526928ea"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.3/sentry-cli-Linux-armv7"
        sha256 "cbb2dcbe0fe6c920db18a85a048937200bd09e72e37b7dda69aae7c34a2c82f2"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.3/sentry-cli-Linux-x86_64"
        sha256 "89c72a4bac6b49f67218807ca39a13b09babf8f8d7b385b69af189509b1e351e"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.21.3/sentry-cli-Linux-i686"
        sha256 "95601d6accfb9f7d4786ae35b2852e20545e0548f8f827c2387237f033d4fe57"
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
