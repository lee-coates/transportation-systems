import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="transportation-systems-analysis",
    version="0.0.1",
    author="Lee Coates",
    author_email="lee.coates.hackathons@gmail.com",
    description="Analysis of Transportation Systems in Python",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/lee-coates/transportation-systems",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
    ],
    python_requires='>=3.6',
)