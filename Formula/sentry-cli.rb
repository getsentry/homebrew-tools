class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.56.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.56.1/sentry-cli-Darwin-universal"
    sha256 "87788404f46205637f0713140bcb20269d9859c0706144fa7a8fbe6e7e02b776"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.56.1/sentry-cli-Linux-aarch64"
        sha256 "cc58bca49593cd6fcda4d934e1bf68f3bed9194156ba122cdb2e4cfd79a23878"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.56.1/sentry-cli-Linux-armv7"
        sha256 "636cf1211e55e816474e227282ebda032bcc75efe074a7f680abcedd092096ac"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.56.1/sentry-cli-Linux-x86_64"
        sha256 "be0bcbf4740c95330cf2d735769f31640d69fd297a2b74ad0cd9ed383814cafa"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.56.1/sentry-cli-Linux-i686"
        sha256 "c913b72fd887be3d1c6bf73161f19b85b7063418bfbc5390df21f9c421515f95"
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
