class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.17.4"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.17.4/sentry-cli-Darwin-universal"
    sha256 "2918835561d4d319630234e4dff906177e87aa1fd745c7f90b1288c275c4e1f1"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.4/sentry-cli-Linux-aarch64"
        sha256 "dd0cd28b3daa422c0c1bb748d276d74ec65d84a2241e77ab04ebf96f6b200faf"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.4/sentry-cli-Linux-armv7"
        sha256 "5cf86e86f344f3bf00acb0010eadf7055ee08d71aadbdd87ac5531a3a0b8c43d"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.4/sentry-cli-Linux-x86_64"
        sha256 "45834bbedcf3f7ec901159f8f9c885d3b0b93cab959ac7f288c56ed37e741d72"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.4/sentry-cli-Linux-i686"
        sha256 "cd641ec59233e8f04e5e06122e69d9431b02fafcef6d751e6a134410152605a4"
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
