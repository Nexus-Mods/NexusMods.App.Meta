using Xunit;
using FluentAssertions;

namespace DummyTest;

public class UnitTest1
{
    [Fact]
    public void Test1()
    {
        true.Should().BeTrue();
    }
}
